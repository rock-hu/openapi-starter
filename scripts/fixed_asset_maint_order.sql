--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: fixed_asset_maint_order; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_maint_order (
    fixed_asset_id character varying(20) NOT NULL,
    maint_hist_seq_id character varying(20) NOT NULL,
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_maint_order OWNER TO ofbiz;

--
-- Name: fixed_asset_maint_order pk_fixed_asset_maint_order; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint_order
    ADD CONSTRAINT pk_fixed_asset_maint_order PRIMARY KEY (fixed_asset_id, maint_hist_seq_id, order_id, order_item_seq_id);


--
-- Name: fxd_ast_mnt_orr_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_mnt_orr_tp ON fixed_asset_maint_order USING btree (last_updated_tx_stamp);


--
-- Name: fxd_ast_mnt_orr_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_mnt_orr_ts ON fixed_asset_maint_order USING btree (created_tx_stamp);


--
-- Name: fxdastmnt_ord; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_ord ON fixed_asset_maint_order USING btree (order_id);


--
-- Name: fxdastmnt_ord_fxas; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_ord_fxas ON fixed_asset_maint_order USING btree (fixed_asset_id);


--
-- Name: fixed_asset_maint_order fxdastmnt_ord; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint_order
    ADD CONSTRAINT fxdastmnt_ord FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: fixed_asset_maint_order fxdastmnt_ord_fxas; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint_order
    ADD CONSTRAINT fxdastmnt_ord_fxas FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- PostgreSQL database dump complete
--

