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
-- Name: product_cost_component_calc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_cost_component_calc (
    product_id character varying(20) NOT NULL,
    cost_component_type_id character varying(20) NOT NULL,
    cost_component_calc_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    sequence_num numeric(20,0),
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_cost_component_calc OWNER TO ofbiz;

--
-- Name: product_cost_component_calc pk_product_cost_component_calc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_cost_component_calc
    ADD CONSTRAINT pk_product_cost_component_calc PRIMARY KEY (product_id, cost_component_type_id, from_date);


--
-- Name: pr_cos_ccc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pr_cos_ccc ON product_cost_component_calc USING btree (cost_component_calc_id);


--
-- Name: pr_cos_cct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pr_cos_cct ON product_cost_component_calc USING btree (cost_component_type_id);


--
-- Name: pr_cos_compcalc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pr_cos_compcalc ON product_cost_component_calc USING btree (product_id);


--
-- Name: prt_cst_cmt_clc_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cst_cmt_clc_tp ON product_cost_component_calc USING btree (last_updated_tx_stamp);


--
-- Name: prt_cst_cmt_clc_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cst_cmt_clc_ts ON product_cost_component_calc USING btree (created_tx_stamp);


--
-- Name: product_cost_component_calc pr_cos_ccc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_cost_component_calc
    ADD CONSTRAINT pr_cos_ccc FOREIGN KEY (cost_component_calc_id) REFERENCES cost_component_calc(cost_component_calc_id);


--
-- Name: product_cost_component_calc pr_cos_cct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_cost_component_calc
    ADD CONSTRAINT pr_cos_cct FOREIGN KEY (cost_component_type_id) REFERENCES cost_component_type(cost_component_type_id);


--
-- Name: product_cost_component_calc pr_cos_compcalc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_cost_component_calc
    ADD CONSTRAINT pr_cos_compcalc FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

