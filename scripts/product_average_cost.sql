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
-- Name: product_average_cost; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_average_cost (
    product_average_cost_type_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    facility_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    average_cost numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_average_cost OWNER TO ofbiz;

--
-- Name: product_average_cost pk_product_average_cost; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_average_cost
    ADD CONSTRAINT pk_product_average_cost PRIMARY KEY (product_average_cost_type_id, organization_party_id, product_id, facility_id, from_date);


--
-- Name: avg_cost_faci; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX avg_cost_faci ON product_average_cost USING btree (facility_id);


--
-- Name: avg_cost_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX avg_cost_party ON product_average_cost USING btree (organization_party_id);


--
-- Name: avg_cost_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX avg_cost_prod ON product_average_cost USING btree (product_id);


--
-- Name: avg_cost_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX avg_cost_type ON product_average_cost USING btree (product_average_cost_type_id);


--
-- Name: prdt_avg_cst_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_avg_cst_txcrs ON product_average_cost USING btree (created_tx_stamp);


--
-- Name: prdt_avg_cst_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_avg_cst_txstp ON product_average_cost USING btree (last_updated_tx_stamp);


--
-- Name: product_average_cost avg_cost_faci; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_average_cost
    ADD CONSTRAINT avg_cost_faci FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: product_average_cost avg_cost_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_average_cost
    ADD CONSTRAINT avg_cost_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: product_average_cost avg_cost_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_average_cost
    ADD CONSTRAINT avg_cost_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_average_cost avg_cost_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_average_cost
    ADD CONSTRAINT avg_cost_type FOREIGN KEY (product_average_cost_type_id) REFERENCES product_average_cost_type(product_average_cost_type_id);


--
-- PostgreSQL database dump complete
--

