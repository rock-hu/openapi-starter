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
-- Name: valid_responsibility; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE valid_responsibility (
    empl_position_type_id character varying(20) NOT NULL,
    responsibility_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.valid_responsibility OWNER TO ofbiz;

--
-- Name: valid_responsibility pk_valid_responsibility; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY valid_responsibility
    ADD CONSTRAINT pk_valid_responsibility PRIMARY KEY (empl_position_type_id, responsibility_type_id, from_date);


--
-- Name: valid_rty_epstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX valid_rty_epstp ON valid_responsibility USING btree (empl_position_type_id);


--
-- Name: valid_rty_rytp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX valid_rty_rytp ON valid_responsibility USING btree (responsibility_type_id);


--
-- Name: vld_rspnsbt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vld_rspnsbt_txcrts ON valid_responsibility USING btree (created_tx_stamp);


--
-- Name: vld_rspnsbt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vld_rspnsbt_txstmp ON valid_responsibility USING btree (last_updated_tx_stamp);


--
-- Name: valid_responsibility valid_rty_epstp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY valid_responsibility
    ADD CONSTRAINT valid_rty_epstp FOREIGN KEY (empl_position_type_id) REFERENCES empl_position_type(empl_position_type_id);


--
-- Name: valid_responsibility valid_rty_rytp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY valid_responsibility
    ADD CONSTRAINT valid_rty_rytp FOREIGN KEY (responsibility_type_id) REFERENCES responsibility_type(responsibility_type_id);


--
-- PostgreSQL database dump complete
--

